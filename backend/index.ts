import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import tokenRoutes from "./routes/tokenRoutes.ts"

dotenv.config();

const app = express();
app.use(cors());
app.use(express.json());

app.use('/api', tokenRoutes);

app.listen(process.env.PORT, () => {
  console.log(`Server running on port ${process.env.PORT}`);
});