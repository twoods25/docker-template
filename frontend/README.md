# Frontend (Placeholder)

> **Note:** Everything in this folder is a temporary placeholder used only to verify that Docker, the backend API, and the database can communicate.

## Current Files
* **`server.js`**: A barebones Node.js HTTP server that fetches `/notes` from `http://backend:8000` and outputs raw HTML.
* **`Dockerfile`**: Runs `node server.js` on port `3000`.

## Replacing With Vite + React
When you are ready to build the real UI:
1. Delete `server.js` and initialize your Vite + React app inside this folder (`npm create vite@latest . -- --template react`).
2. Update `Dockerfile` to install dependencies (`npm install`) and run the dev server (`npm run dev -- --host 0.0.0.0 --port 3000`) or serve a production build.
3. **Networking note:** Because React runs in your browser (not inside Docker), update API calls to point to `http://localhost:8000` instead of `http://backend:8000`, and enable CORS in `backend/app/main.py`.
