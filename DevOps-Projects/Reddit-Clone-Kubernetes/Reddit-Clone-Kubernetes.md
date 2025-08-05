#Reddit-Clone-Kubernetes


```python
node -v
npm -v
```

```python
sudo apt update
sudo apt install nodejs npm
```

```python
npm install --legacy-peer-deps
```

```python
npm ls
```

```python
FROM node:19-alpine3.15

WORKDIR /reddit-clone

COPY . /reddit-clone

RUN npm install --legacy-peer-deps

EXPOSE 3000

CMD ["npm", "run", "dev"]
```
