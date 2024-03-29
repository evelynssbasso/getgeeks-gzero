robot -l NONE -o NONE -r NONE tasks/Delorean.robot
#robot -d ./logs  tests/AttemptBeGeek.robot
#robot -d ./logs -v BROWSER:chromium -v HEADLESS:True -i smoke tests
pabot -x xunit.xml -d ./logs -v BROWSER:chromium -v HEADLESS:True tests

# ./run.sh
rm -rf ./logs/browser
mkdir ./logs/browser
mkdir ./logs/browser/screenshot

cp $(find ./logs/pabot_results -type f -name "*png") ./logs/browser/screenshot/