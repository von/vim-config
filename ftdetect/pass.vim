" Recognize password-store files
if has("autocmd")
    autocmd BufNewFile,BufRead pass.XXXXXXXXXXXXX.* setf pass
endif
