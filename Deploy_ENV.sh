#proj=
#path of the project + ENV directory
ENV_dir=$proj + '/Implementation/SharedObjects/Environments'
#var for deployment success/fail
ENV_Deploy=False
#check if the directory "Environments" exist
if [ -d $ENV_dir]
then
    echo 'DEPLOY ENVIRONMENTS FROM FILE' + $ENV_dir + ';' | fabric  
else
    echo "Error: Directory $ENV_dir does not exists."
    break
fi

#check if WS deployed
ENV_numbers=echo 'list envs;' | fabric | wc -l
if [$ENV_numbers >= 5]
then
    echo 'list envs;' | fabric | awk '{print $1}' | cut -d '|' -f2 | head -n ($ENV_numbers -2)
    ENV_Deploy=True
else
    echo "Deploy ENV failed"
    break
fi
