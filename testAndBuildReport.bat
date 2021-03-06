@echo off

SET ALLURE_RESULTS_FOLDER=".\allure-results"
SET HISTORY_SOURCE_FOLDER=".\target\site\allure-maven-plugin\history"
SET HISTORY_DESTINATION_FOLDER=".\target\allure-results\history"

IF NOT EXIST %ALLURE_RESULTS_FOLDER% mkdir %ALLURE_RESULTS_FOLDER%
IF EXIST %HISTORY_DESTINATION_FOLDER% del /S /Q %HISTORY_DESTINATION_FOLDER%
mkdir %HISTORY_DESTINATION_FOLDER%

IF EXIST %HISTORY_SOURCE_FOLDER% copy /Y %HISTORY_SOURCE_FOLDER% %ALLURE_RESULTS_FOLDER%
copy /Y %ALLURE_RESULTS_FOLDER% %HISTORY_DESTINATION_FOLDER%

call mvn test allure:report