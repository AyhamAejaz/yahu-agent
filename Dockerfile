FROM node:20-slim
RUN apt-get update && apt-get install -y python3 make g++ git && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY package*.json ./
RUN npm install --legacy-peer-deps --ignore-scripts
COPY . .
EXPOSE 3000
CMD ["node", "--loader", "ts-node/esm", "src/index.ts", "--characters=characters/yahu.character.json"]
