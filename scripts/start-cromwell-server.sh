# Data file paths
REFERENCE="/path/to/hg38"

# Interval list files
INTERVALS="`pwd`/intervals"

# Tools folder
TOOLS="`pwd`/tools"

# Application config
APPCONFIG="`pwd`/cromwell-mysql/cromwell/app-config/"

# Working directory
WORKINGDIR="`pwd`"

docker run --rm -t -p 8000:8000 \
-v=`pwd`/cromwell-executions:/cromwell-executions \
-v=`pwd`/cromwell-workflow-logs:/cromwell-workflow-logs \
-v=$APPCONFIG:/cromwell \
-v=$INTERVALS:/intervals \
-v=$WORKINGDIR:/wdl_pipeline \
-v=$TOOLS:/tools \
-v=$REFERENCE:/references \
oskarv/wdl \
java -jar -Dconfig.file=/cromwell/application.conf \
/tools/cromwell-30.1.jar server
