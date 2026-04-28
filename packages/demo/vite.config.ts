import { viteStaticCopy } from "vite-plugin-static-copy";

export default {
	// Don't use /src/index.tsx as entry — we're vanilla JS now
	build: {
		rollupOptions: {
			input: "index.html",
		},
	},
	plugins: [
		viteStaticCopy({
			structured: false,
			targets: [
				{
					src: "node_modules/@mercuryworkshop/scramjet/dist/*",
					dest: "scramjet",
				},
				{
					src: "node_modules/@mercuryworkshop/scramjet-controller/dist/*",
					dest: "controller",
				},
				// Your OS assets
				{
					src: "../../public/index.css",
					dest: ".",
				},
				{
					src: "../../public/games.css",
					dest: ".",
				},
				{
					src: "../../public/index.js",
					dest: ".",
				},
				{
					src: "../../public/games.js",
					dest: ".",
				},
				{
					src: "../../public/search.js",
					dest: ".",
				},
				{
					src: "../../public/register-sw.js",
					dest: ".",
				},
				{
					src: "../../public/wallpaper.webp",
					dest: ".",
				},
				{
					src: "../../public/favicon.webp",
					dest: ".",
				},
			],
		}),
	],
};
