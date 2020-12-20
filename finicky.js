// ~/.finicky.js

module.exports = {
  defaultBrowser: "/Applications/Safari Technology Preview.app",
  rewrite: [
    {
      // Redirect all urls to use https
      match: ({ url }) => url.protocol === "http",
      url: { protocol: "https" },
    },
  ],
  rewrite: [
    {
      match: () => true, // Execute rewrite on all incoming urls to make this example easier to understand
      url({ url }) {
        const removeKeysStartingWith = ["utm_", "uta_"]; // Remove all query parameters beginning with these strings
        const removeKeys = ["fblid", "gclid"]; // Remove all query parameters matching these keys

        const search = url.search
          .split("&")
          .map((parameter) => parameter.split("="))
          .filter(([key]) =>
            removeKeysStartingWith.some(
              (startingWith) => !key.startsWith(startingWith)
            )
          )
          .filter(([key]) => removeKeys.some((removeKey) => key !== removeKey));

        return {
          ...url,
          search: search.map((parameter) => parameter.join("=")).join("&"),
        };
      },
    },
  ],
  handlers: [
    {
      // Open microsoft stuff in Edge Dev
      match: [
        "*.microsoft.com*",
        "*.office.net",
        "*.office.com",
        "*.teams.*",
        "*.sharepoint.*",
        "*.sharepoint-df.*",
        "*.visualstudio.*",
      ],
      browser: "/Applications/Microsoft Edge Dev.app",
    },
    {
      // Open Apple Music links directly in Music.app
      match: ["music.apple.com*", "geo.music.apple.com*"],
      url: {
        protocol: "itmss",
      },
      browser: "Music",
    },
    {
      match: finicky.matchHostnames(["teams.microsoft.com"]),
      browser: "com.microsoft.teams",
      url({ url }) {
        return {
          ...url,
          protocol: "msteams",
        };
      },
    },
    {
      match: "https://www.figma.com/file/*",
      browser: "Figma",
    },
  ],
};
