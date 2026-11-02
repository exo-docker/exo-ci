#!/usr/bin/env bash
# Regenerate the images table of README.md from .github/table-template.md.
#
# Usage: .github/scripts/update-readme.sh [--offline]
# The versions to resolve are discovered from the ${JDK<major>_VERSION} and
# ${MVN<major><minor>_VERSION} placeholders of the template (e.g. MVN310 = 3.10),
# so adding a row there is all it takes to track a new JDK or Maven line.
#   --offline   do not query Azul / Maven Central; placeholders are left as is.
set -euo pipefail

cd "$(dirname "$0")/../.."
README=README.md
TEMPLATE=.github/table-template.md
START='<!-- GHASTART -->'
END='<!-- GHAEND -->'

for marker in "$START" "$END"; do
  grep -qF "$marker" "$README" || { echo "Error: $marker not found in $README" >&2; exit 1; }
done

latest_jdk() { # $1 = major
  curl -fsSL -H 'accept: application/json' \
    "https://api.azul.com/metadata/v1/zulu/packages/?java_version=$1&os=ubuntu&arch=amd&java_package_type=jdk&javafx_bundled=false&release_status=ga&availability_types=CA&certifications=tck&page=1&page_size=1" \
    | jq -r '.[0].java_version[0:3] | join(".")'
}

latest_maven() { # $1 = major.minor ; prefers GA over rc/alpha/beta
  local versions
  versions=$(curl -fsSL https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/maven-metadata.xml \
    | grep -oP '(?<=<version>)[^<]+' | grep -P "^$1\." || true)
  # GA first; fall back to the newest pre-release (e.g. Maven 4.0.0-rc-N)
  local ga
  ga=$(echo "$versions" | grep -P '^[0-9.]+$' | sort -V | tail -1 || true)
  echo "${ga:-$(echo "$versions" | sort -V | tail -1)}"
}

if [ "${1:-}" != "--offline" ]; then
  for major in $(grep -oP '\$\{JDK\K[0-9]+(?=_VERSION\})' "$TEMPLATE" | sort -un); do
    v=$(latest_jdk "$major")
    [ -n "$v" ] || { echo "Error: no version for JDK $major" >&2; exit 1; }
    export "JDK${major}_VERSION=$v"
  done
  for code in $(grep -oP '\$\{MVN\K[0-9]+(?=_VERSION\})' "$TEMPLATE" | sort -un); do
    line="${code:0:1}.${code:1}" # 39 -> 3.9, 310 -> 3.10
    v=$(latest_maven "$line")
    [ -n "$v" ] || { echo "Error: no version for Maven $line" >&2; exit 1; }
    export "MVN${code}_VERSION=$v"
  done
fi

tmp=$(mktemp)
trap 'rm -f "$tmp" "$tmp.table"' EXIT
perl -pe 's/\$\{([^}]+)\}/$ENV{$1} || "\${$1}"/ge' "$TEMPLATE" \
  | column -t -s '|' -o '|' > "$tmp.table"
{
  sed "/$START/q" "$README"
  cat "$tmp.table"
  sed -n "/$END/,\$p" "$README"
} > "$tmp"
cp -f "$tmp" "$README"
