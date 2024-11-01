#!/bin/bash


alias get_version='grep -E "^version = " Cargo.toml | awk -F\" "{print \$2}"'

ORG_NAME="TopoHedralLabs"
REPO_URLS=

clone_all() {
    
	ORG_NAME="TopoHedralLabs"
    	# Fetch repository URLs for the organization
    	REPO_URLS=$(gh repo list "$ORG_NAME" --limit 1000 --json url --jq '.[].url')
    
    	# Check if any URLs were returned
    	if [ -z "$REPO_URLS" ]; then
        	echo "No repositories found or organization name may be incorrect."
        	return 1
    	fi

	# Loop through each URL and clone the repository
	for url in $REPO_URLS; do
		echo "Cloning $url..."
		git clone "$url"
	done
}
