import magma as m
import mantle as mantle
from magma.testing import check_files_equal
from collections import namedtuple

from generator_utils import build_module_from_magma
from magma_codegen import create_connect_box

import os

build_module_from_magma('connect_box', create_connect_box(1))
