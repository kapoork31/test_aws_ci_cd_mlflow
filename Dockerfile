# set base image (host OS)
FROM python:3.8

RUN pip install mlflow \
    pip install awscli \
    pip install boto3 \
    pip install pymysql

# install dependencies

ENV PORT 5000

# command to run on container start
CMD mlflow server \
    --backend-store-uri mysql+pymysql://${username}:password@${db_host}:${db_port}/${db_name} \
    --default-artifact-root ${artifact_root} \
    --host 0.0.0.0
