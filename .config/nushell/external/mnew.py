import subprocess
from argparse import ArgumentParser

command = "mvn archetype:generate -DgroupId={} -DartifactId={} -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion={} -DinteractiveMode={}"

def main(group_id: str, artifact_id: str, version: float, interactive: str) -> None:
    # subprocess.Popen([""])
    commander = command.format(
        group_id.lower(),
        artifact_id.lower(),
        version,
        interactive.lower(),
    )
    subprocess.Popen(command.split(), stdout=subprocess.PIPE) 


if __name__ == '__main__':
    parser = ArgumentParser(
        description="Maven generate without the hassle of typing it all!",
    )
    parser.add_argument("group_id", type = str)
    parser.add_argument("artifact_id", type = str)
    parser.add_argument("version", default="1.5", nargs="?")
    parser.add_argument("interactive", default="False", nargs="?")
    args = parser.parse_args()
    main(
        group_id=args.group_id,
        artifact_id=args.artifact_id,
        version=args.version,
        interactive=args.interactive,
    ) 
