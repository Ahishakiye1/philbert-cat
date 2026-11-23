
#!/bin/bash

echo "===================================="
echo " Running Vision Ltd Automated Tests"
echo "===================================="

# Test 1: Check whether index.html exists
if [ -f index.html ]; then
    echo "TEST 1 PASSED: index.html exists."
else
    echo "TEST 1 FAILED: index.html is missing."
    exit 1
fi

# Test 2: Check Vision Ltd content
if grep -q "Vision Ltd" index.html; then
    echo "TEST 2 PASSED: Vision Ltd content verified."
else
    echo "TEST 2 FAILED: Vision Ltd content missing."
    exit 1
fi

# Test 3: Check Version V6
if grep -q "Version V6" index.html; then
    echo "TEST 3 PASSED: Version V6 verified."
else
    echo "TEST 3 FAILED: Version V6 missing."
    exit 1
fi

echo "===================================="
echo " ALL TESTS PASSED SUCCESSFULLY!"
echo "===================================="

exit 0
