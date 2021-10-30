# API document

## endpoint
`http://localhost:3000/`

### users
- get
    - show_all
        - `curl http://localhost:3000/api/v1/users`
    - show target id user
        - `curl http://localhost:3000/api/v1/users/1`
- post
    - `curl -X POST -d 'param={"name":"sample_name","email":"sample.example.com"}' http://localhost:3000/api/v1/users`
- delete
    - `curl -X DELETE http://localhost:3000/api/v1/users/1`


### movies
- get
    - show_all
        - `curl http://localhost:3000/api/v1/movies`
    - show target id user
        - `curl http://localhost:3000/api/v1/movies/1`
- post
    - `curl -X POST -d 'param={"title":"sample_title"}' http://localhost:3000/api/v1/movies`
- delete
    - `curl -X DELETE http://localhost:3000/api/v1/movies/1`