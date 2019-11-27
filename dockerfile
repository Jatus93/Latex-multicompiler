FROM danteev/texlive

COPY entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
