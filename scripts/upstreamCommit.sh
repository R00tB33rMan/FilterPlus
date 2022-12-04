#!/usr/bin/env bash

# requires curl & jq

# upstreamCommit --purpur HASH --petal HASH
# flag: --purpur HASH - the commit hash to use for comparing commits between purpur (PurpurMC/Purpur/compare/HASH...HEAD)
# flag: --petal HASH - the commit hash to use for comparing commits between petal (Bloom-host/Petal/compare/HASH...HEAD)

function getCommits() {
    curl -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/"$1"/compare/"$2"...HEAD | jq -r '.commits[] | "'"$1"'@\(.sha[:7]) \(.commit.message | split("\r\n")[0] | split("\n")[0])"'
}

(
set -e
PS1="$"

purpurHash=""
petalHash=""

TEMP=$(getopt --long purpur:,petal: -o "" -- "$@")
eval set -- "$TEMP"
while true; do
    case "$1" in
        --purpur)
            purpurHash="$2"
            shift 2
            ;;
        --petal)
            petalHash="$2"
            shift 2
            ;;
        *)
            break
            ;;
    esac
done

purpur=""
petal=""
updated=""
logsuffix=""

# Purpur updates
if [ -n "$purpurHash" ]; then
    purpur=$(getCommits "R00tB33rMan/Purpur-Upstream" "$purpurHash")

    # Updates found
    if [ -n "$purpur" ]; then
        updated="Purpur"
        logsuffix="$logsuffix\n\nPurpur Changes:\n$purpur"
    fi
fi

# Petal updates
if [ -n "$petalHash" ]; then
    petal=$(getCommits "Bloom-host/Petal" "$petalHash")

    # Updates found
    if [ -n "$petal" ]; then
        updated="Petal"
        logsuffix="$logsuffix\n\nPetal Changes:\n$petal"
    fi
fi

# Both have updates
if [ -n "$purpur" ] && [ -n "$petal" ]; then
    updated="Purpur & Petal"
fi

disclaimer="Upstream has released updates that appear to apply and compile correctly"
log="Updated Upstream ($updated)\n\n${disclaimer}${logsuffix}"

echo -e "$log" | git commit -F -

) || exit 1
