-- map .cu / .cuh to the "cuda" file-type everywhere
vim.filetype.add {
  extension = {
    cu  = "cuda",
    cuh = "cuda",
  },
}

