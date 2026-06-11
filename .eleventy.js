module.exports = function (eleventyConfig) {
  eleventyConfig.addPassthroughCopy("style.css");
  eleventyConfig.addPassthroughCopy("fonts");
  eleventyConfig.addPassthroughCopy("meow");
  eleventyConfig.addPassthroughCopy("img");

  return {
    dir: {
      input: ".",
      output: "_site",
    },
  };
};
