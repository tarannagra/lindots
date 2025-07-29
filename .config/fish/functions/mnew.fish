function mnew 
    if test (count $argv) -lt 4
        echo "Usage: mnew <group_id> <artifact_id> <archetype_version> <interactive_mode>"
        return 1
    end
    set group_id $argv[1]
    set artifact_id $argv[2]
    set arch_version $argv[3]
    set interactive $argv[4]
    set identifier "maven-archetype-quickstart"

    mvn archetype:generate -DgroupId=$group_id -DartifactId=$artifact_id -DarchetypeArtifactId=$identifier -DarchetypeVersion=$arch_version -DinteractiveMode=$interactive
    cd $artifact_id

    begin
        printf "all: build run\n"
        printf "build:\n"
        printf "\t@mvn package\n"
        printf "run:\n"
        printf "\t@java -cp target/$artifact_id-1.0-SNAPSHOT.jar $group_id.App\n"
        printf "clean:\n"
        printf "\t@mvn clean"
    end > Makefile
    echo -e "\nMakefile successfully generated!"
    # echo "Building:\n-> mvn package"
    # echo "Running:\n-> java -cp target/$artifact_id-1.0-SNAPSHOT.jar $group_id.App"
end
