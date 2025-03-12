# Build the installer for Windows.
# This script must be run from the root of the repository.

Remove-Item -Recurse -Force -ErrorAction SilentlyContinue ./build_pyinstaller
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue ./dist_pyinstaller


$WHL_NAME = (Get-ChildItem -Path "dist" -Filter "*.whl").Name
pip install "dist/$WHL_NAME[stable,plotting-stable,legacy-stable]"

# Creating the stand-alone pyinstaller folder
pyinstaller release/pyinstaller/alphatims.spec --distpath dist_pyinstaller --workpath build_pyinstaller -y