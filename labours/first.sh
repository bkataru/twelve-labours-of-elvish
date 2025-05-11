# requires: curl, jq

API_URL='https://jsonplaceholder.typicode.com/posts/1'

# fetch and parse, storing results in variables requires multiple jq calls/evals
POST_DATA=$(curl -s "$API_URL") # POST_DATA is a string

# extracting fields requires parsing the string again
USER_ID=$(echo "$POST_DATA" | jq -r '.userId')
POST_TITLE=$(echo "$POST_DATA" | jq -r '.title')
POST_BODY=$(echo "$POST_DATA" | jq -r '.body')

echo "--- Post Details ---"
echo "User ID: ${USER_ID}"
echo "Title:   ${POST_TITLE}"
echo "Body:    ${POST_BODY}"
echo "--------------------"
