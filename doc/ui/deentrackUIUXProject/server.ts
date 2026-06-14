import express from "express";
import path from "path";
import dotenv from "dotenv";
import { createServer as createViteServer } from "vite";
import { GoogleGenAI } from "@google/genai";

dotenv.config();

const app = express();
const PORT = 3000;

app.use(express.json());

// List of high-fidelity pre-curated offline fallback quotes for maximum reliability
const OFFLINE_QUOTES = [
  {
    text: "So remember Me; I will remember you. And be grateful to Me and do not deny Me.",
    source: "Surah Al-Baqarah 2:152",
    theme: "Remembrance & Gratitude",
    author: "Quran"
  },
  {
    text: "Verily, with hardship, there is relief. Verily, with hardship, there is relief.",
    source: "Surah Ash-Sharh 94:5-6",
    theme: "Patience & Hope",
    author: "Quran"
  },
  {
    text: "And He found you lost and guided you.",
    source: "Surah Ad-Duha 93:7",
    theme: "Divine Guidance",
    author: "Quran"
  },
  {
    text: "The most beloved deeds to Allah are those which are continuous, even if they are small.",
    source: "Sahih al-Bukhari",
    theme: "Consistency in Habits",
    author: "Prophet Muhammad (ﷺ)"
  },
  {
    text: "Indeed, Allah does not change the condition of a people until they change what is in themselves.",
    source: "Surah Ar-Ra'd 13:11",
    theme: "Self-Improvement",
    author: "Quran"
  },
  {
    text: "And establish prayer at the two ends of the day and at the approach of the night. Indeed, good deeds do away with misdeeds.",
    source: "Surah Hud 11:114",
    theme: "The Power of Salah",
    author: "Quran"
  }
];

// Lazy helper to get Gemini client
let aiInstance: GoogleGenAI | null = null;
function getAI(): GoogleGenAI | null {
  const apiKey = process.env.GEMINI_API_KEY;
  if (!apiKey || apiKey === "MY_GEMINI_API_KEY" || apiKey.trim() === "") {
    return null;
  }
  if (!aiInstance) {
    aiInstance = new GoogleGenAI({
      apiKey: apiKey,
      httpOptions: {
        headers: {
          "User-Agent": "aistudio-build",
        }
      }
    });
  }
  return aiInstance;
}

// API endpoint to fetch a dynamic reflection
app.post("/api/reflect", async (req, res) => {
  try {
    const { mood, topic } = req.body;
    const ai = getAI();
    
    if (!ai) {
      // Return a random beautiful local quote from our elite collection
      const randomQuote = OFFLINE_QUOTES[Math.floor(Math.random() * OFFLINE_QUOTES.length)];
      return res.json({
        quote: randomQuote.text,
        source: randomQuote.source,
        theme: randomQuote.theme,
        author: randomQuote.author,
        isAi: false,
        note: "Note: Running in offline/fallback mode (no API key configured)."
      });
    }

    const moodPrompt = mood ? `The user is feeling: "${mood}". ` : "";
    const topicPrompt = topic ? `They are looking for wisdom about: "${topic}". ` : "They are looking for general wisdom on habits, prayer, or spirituality. ";
    
    const prompt = `You are a warm, wise, and highly respected Islamic spiritual mentor. 
Generate a short, inspiring spiritual reminder (maximum 3 sentences) suitable for a daily journal card.
${moodPrompt}${topicPrompt}
Include:
1. One precise verse from the Holy Quran or a sahih Hadith (with reference name, surah and verse details).
2. A very brief (1 sentence) modern, motivating companion reflection on how this applies to building simple positive daily habits (Salah consistency, patience, mindfulness, self-excellence).

Return the response strictly as a JSON object of this structure (do not wrap in markdown blocks, just the raw JSON object string):
{
  "quote": "The quote translation text or Hadith text.",
  "source": "Surah name and verse (e.g. Surah Al-Kahf 18:46) or Hadith collection name",
  "theme": "A 2-3 word focus label (e.g. Patience & Resilience, Habit consistency, Inner peace)",
  "author": "Either 'Quran' or 'Prophet Muhammad (ﷺ)'"
}`;

    const response = await ai.models.generateContent({
      model: "gemini-3.5-flash",
      contents: prompt,
      config: {
        responseMimeType: "application/json",
      }
    });

    const text = response.text?.trim() || "";
    const parsed = JSON.parse(text);
    return res.json({
      ...parsed,
      isAi: true
    });
  } catch (err: any) {
    console.error("Gemini API error:", err);
    // Fallback to offline quotes on any parsing or network error
    const randomQuote = OFFLINE_QUOTES[Math.floor(Math.random() * OFFLINE_QUOTES.length)];
    return res.json({
      quote: randomQuote.text,
      source: randomQuote.source,
      theme: randomQuote.theme,
      author: randomQuote.author,
      isAi: false,
      note: "Offline fallback utilized due to connection or config issue."
    });
  }
});

async function startServer() {
  if (process.env.NODE_ENV !== "production") {
    const vite = await createViteServer({
      server: { middlewareMode: true },
      appType: "spa",
    });
    app.use(vite.middlewares);
  } else {
    // Service static build in production
    const distPath = path.join(process.cwd(), "dist");
    app.use(express.static(distPath));
    app.get("*", (req, res) => {
      res.sendFile(path.join(distPath, "index.html"));
    });
  }

  app.listen(PORT, "0.0.0.0", () => {
    console.log(`[DeenTrack Server] Running on http://0.0.0.0:${PORT}`);
  });
}

startServer();
