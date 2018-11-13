# Setup Project

`bundle`
`cp config/database.yml.example config/database.yml`
`rake db:setup`
`rails s`

# Run specs
`rspec`

# Development test

```
POST: http://localhost:3000/api/v1/resize

Body:

{
  "image": {
    "url": "https://images.mentalfloss.com/sites/default/files/styles/mf_image_16x9/public/olly_0_0.jpg?itok=EEKs9jMQ&resize=1100x1100",
    "width": 200,
    "height": 200
  }
}
```

# To deploy

Use heroku, or EC2 instance using capistrano, or AWS Elastic bean stalk.
