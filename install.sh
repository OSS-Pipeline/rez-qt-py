#!/usr/bin/bash

# Will exit the Bash script the moment any command will itself exit with a non-zero status, thus an error.
set -e

INSTALL_PATH=${REZ_BUILD_INSTALL_PATH}
QT_PY_URL=$1
QT_PY_VERSION=${REZ_BUILD_PROJECT_VERSION}

# We print the arguments passed to the Bash script.
echo -e "\n"
echo -e "==============="
echo -e "=== INSTALL ==="
echo -e "==============="
echo -e "\n"

echo -e "[INSTALL][ARGS] INSTALL PATH: ${INSTALL_PATH}"
echo -e "[INSTALL][ARGS] QT.PY URL: ${QT_PY_URL}"
echo -e "[INSTALL][ARGS] QT.PY VERSION: ${QT_PY_VERSION}"

# We check if the arguments variables we need are correctly set.
# If not, we abort the process.
if [[ -z ${INSTALL_PATH} || -z ${QT_PY_URL} || -z ${QT_PY_VERSION} ]]; then
    echo -e "\n"
    echo -e "[INSTALL][ARGS] One or more of the argument variables are empty. Aborting..."
    echo -e "\n"

    exit 1
fi

# We install Qt.Py.
echo -e "\n"
echo -e "[INSTALL] Installing Qt.Py-${QT_PY_VERSION}..."
echo -e "\n"

# We call the pip command to install the Wheel file into our package.
pip2 \
    install ${QT_PY_URL} \
    --target ${INSTALL_PATH} \
    --upgrade \
    --no-dependencies

echo -e "\n"
echo -e "[INSTALL] Finished installing Qt.Py-${QT_PY_VERSION}!"
echo -e "\n"
