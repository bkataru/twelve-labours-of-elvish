# Processing JSON Data from a Web API
# requires: curl

use builtin # implicitly available, but good practice for clarity in scripts

# 1. define the API URL in a variable
var api-url = 'https://jsonplaceholder.typicode.com/posts/1'

# 2. fetch the data using curl, pipe bytes to from-json
# curl -s: silent mode
# from-json: reads byte input, outputs Elvish value (a map in this case)
var post-data = (curl -s $api-url | from-json)

# 3. access fields of the map using indexing
var user-id = $post-data[userId]
var post-title = $post-data[title]
var post-body = $post-data[body]

# 4. output the extracted data
echo '--- Post Details ---'
echo 'User ID: '$user-id
echo 'Title:   '$post-title
echo 'Body:    '$post-body
echo '--------------------'

# p.s.: let's also verify the type of the parsed data
echo 'Type of post-data: '(kind-of $post-data)
