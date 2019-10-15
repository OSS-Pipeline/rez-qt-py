name = "qt_py"

version = "1.2.1"

authors = [
    "Marcus Ottosson"
]

description = \
    """
    Python 2 & 3 compatibility wrapper around all Qt bindings - PySide, PySide2, PyQt4 and PyQt5.
    """

requires = [
    "cmake-3+",
    "pip-19+",
    "python-2.7<3"
]

variants = [
    ["platform-linux"]
]

build_system = "cmake"

with scope("config") as config:
    config.build_thread_count = "logical_cores"

uuid = "qt_py-{version}".format(version=str(version))

def commands():
    env.PYTHONPATH.prepend("{root}")
    env.QT_PREFERRED_BINDING.set("PySide2")
