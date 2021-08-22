import boto3

s3 = boto3.resource('s3')
my_bucket = s3.Bucket('copr-proj-aug21')
counter = 0
for my_bucket_object in my_bucket.objects.all():
    print(my_bucket_object)
    counter += 1
print("The total number of items: ",counter)
