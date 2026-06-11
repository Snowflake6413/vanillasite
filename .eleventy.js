module.exports = function (eleventyConfig) {
    eleventyConfig.addPassthroughCopy("style.css")
    eleventyConfig.addPassthroughCopy("fonts")

    return {
        dir: {
            input: ".",
            output: "_site"
        }
    }
}