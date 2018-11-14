This app has an api to resize images from a url. I started thinking I was going to build a frontend react component where you can drag and drop an image. After building half of it I decided to leave the react component out so it's just an api only.  

# Setup Project

 1. `bundle`
 2. `cp config/database.yml.example config/database.yml`
 3. `rake db:setup`
 4. `rails s`

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

Use heroku if you want to deploy easily and install sidekiq when needed. It not cheap compared to options.

EC2 instance using capistrano its just harder to install sidekiq when needed.

AWS Elastic bean stalk, it's cheap, deploys easily and can install sidekiq much easier then EC2.

# Scaling

This app will not scale. The ResizeImage service should be put
into a background job such as sidekiq.
