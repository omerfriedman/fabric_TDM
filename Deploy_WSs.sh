#proj=
fabric_scripts_dir=/usr/local/k2view/fabric/scripts/
#path of the project + WS directory
WS_dir=$proj+'/Implementation/LogicalUnits/k2_ws'
#var for deployment success/fail
ENV_Deploy=False
#numbers of tries for Deployment
tries_number=3
#check if the directory "k2_ws" exist
if [ -d $WS_dir]
then
    cd $fabric_scripts_dir
    for i in {1..$tries_number}
    do    
        ./buildAndDeployArtifacts.sh -pd $proj -l k2_ws
        #check script success from R&D
        if []
        then
            ENV_Deploy=true
        fi
        if [ENV_Deploy=True]
        then
            break
        fi    
    done
else
    echo "Error: Directory $WS_dir does not exists."
    break
fi

#check if WS deployed
WS_numbers=echo 'list ws;' | fabric | wc -l
if [$WS_numbers > 4]
then
    echo 'list ws;' | fabric | awk '{print $1}' | cut -d '|' -f2 | head -n ($WS_numbers -2)
else
    echo "Deploy WS failed"
    break
fi
