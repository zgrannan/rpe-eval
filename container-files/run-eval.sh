#!/bin/bash

# Function to run test and record time
run_test() {
    local dir=$1
    local start_time=$(date +%s)
    cd "$dir"
    ./test-rpe.sh --old
    local end_time=$(date +%s)
    local total_time=$((end_time - start_time))
    echo "$dir: $total_time seconds" >> /workspace/time.txt
}

# Clear previous results
> /workspace/time.txt

# Run test for prusti-dev
run_test /workspace/prusti-dev

# Run test for prusti-dev-orig
run_test /workspace/prusti-dev-orig

# Return to the original directory
cd /workspace
