#docker run --rm -it -v "$(1):/workspace" vim-test /bin/bash
docker run --rm -it -v "$(pwd):/workspace" vim-test /bin/bash
