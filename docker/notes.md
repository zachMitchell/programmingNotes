Docker
======
[Main Documentation](https://docs.docker.com/get-started/)
[Builder Reference](https://docs.docker.com/engine/reference/builder/)

I stumbled around everywhere trying to understand how docker's system works. Mostly sticking to the official docs, but here are some nots on how to use the thing XP

## The primary things you need to know:
* when making a container, you only need to run the `docker run` command once! afterwards you can run  `docker start <name/id>`

* to start a terminal in your container, you need the flag `-it` (interactive terminal), then specify your terminal command after the container name