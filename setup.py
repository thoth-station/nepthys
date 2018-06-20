import os
from setuptools import setup


def get_version():
    with open(os.path.join('nepthys', '__init__.py')) as f:
        content = f.readlines()

    for line in content:
        if line.startswith('__version__ ='):
            # dirty, remove trailing and leading chars
            return line.split(' = ')[1][1:-2]
    raise ValueError("No version identifier found")


setup(
    name='nepthys',
    version=get_version(),
    description='Taking your code back to live as an interactive documentation automatically.',
    long_description='Taking your code back to live as an interactive documentation automatically.',
    author='Fridolin Pokorny',
    author_email='fridolin@redhat.com',
    license='GPLv3+',
    packages=[
        'nepthys',
    ],
    install_requires=[]
)
