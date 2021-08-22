# Create a bucket
resource "aws_s3_bucket" "b1" {
  bucket = "copr-proj-aug21"
  acl    = "public-read" # or can be "public-read"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

# Upload an object
resource "aws_s3_bucket_object" "object1" {
  for_each = fileset("myfiles/", "*")
  bucket   = aws_s3_bucket.b1.id
  key      = each.value
  source   = "myfiles/${each.value}"
  etag     = filemd5("myfiles/${each.value}")

}
