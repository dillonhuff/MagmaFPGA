import magma as m
import mantle as mantle
from magma.testing import check_files_equal
from collections import namedtuple

from generator_utils import build_module_from_magma
from magma_codegen import create_io1in_pad
import os

build_module_from_magma('io1in_pad', create_io1in_pad())
