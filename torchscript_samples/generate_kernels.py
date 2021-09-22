from glob import glob
import os
import argparse
import subprocess

def generate_kernels_from_torchscript(npcomp_exec_path):
  torchscript_mlir_files = glob("*torchscript.mlir")
  kernel_names_to_files = {}
  for x in torchscript_mlir_files:
    kernel_names_to_files[x] = x[:-17]
    command = " ".join([npcomp_exec_path,x, "-torchscript-to-npcomp-backend-pipeline",">", x[:-16]+"linalg.mlir"])
    subprocess.run([command], shell=True, check=False)


parser = argparse.ArgumentParser(description='Generates linalg kernels')
parser.add_argument('npcomp_opt_path', help='path to npcomp-opt')
if __name__ == "__main__":
  args = parser.parse_args()
  if "npcomp-opt" not in args.npcomp_opt_path:
    args.npcomp_opt_path = os.path.join(args.npcomp_opt_path, "npcomp-opt")
  generate_kernels_from_torchscript(args.npcomp_opt_path)
