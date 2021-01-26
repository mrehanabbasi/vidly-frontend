FROM node:12.17.0-alpine

LABEL name="Vidly" \
  maintainer="MRA" \
  summary="Frontend of a Node Express video rental application."

# ARG jwtPrivateKey

ENV PORT=3000

WORKDIR /app

EXPOSE $PORT

# RUN groupadd -r vidly && useradd -m -r -g -s /bin/sh vidly vidly

# USER vidly

COPY package*.json ./

RUN npm install

COPY . .

CMD ["npm", "start"]
