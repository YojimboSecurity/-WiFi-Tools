# Style Guideline

Here you will find the documentation and code style guideline for Primus. These
guidelines are to be strictly adhered to whenever applicable.

## Code

Follow Googles Shell Style Guide.

<https://google.github.io/styleguide/shellguide.html>

## Git

Follow this guide for git commits.

<https://cbea.ms/git-commit>

## Documentation

There are four types of documentation, tutorials, how-to guides, explanation,
and reference. Each has its purpose and place. Below is a visual representation
that should help you understand each and its purpose.

![style guideline overview](docs/media/style_guideline_overview.png "Style Guideline Overview")


| 	| Tutorials | How-to guides | Reference | Explanation |
|-	|-	|-	|-	|-	|
|  oriented to | learn	| a goal   |  information | understanding  |
| must | allow the newcomer to get started | show how to solve a specific problem | describe the machinery | explain |
| its form | a lesson | a series of steps | dry description | descriptive explanation |
| analogy | teaching a small child how to cook | a recipe in a cookbook | a reference encyclopedia article | an article on culinary social history |

- https://documentation.divio.com/introduction/


With that said there is directory hierarchy as seen below.
```
docs/ -|
       |- explanation/
       |
       |- how_to/ -|
       |           |- ipyn/
       |
       |- reference/ -|
       |              |- ipyn/
       |
       |- tutorial/ -|
       |             |- ipyn/
```

### Tutorials

Tutorials are to help beginners get started. The goal is to encourage them and
help them gain confidence. The voice should be positive and geared to learning
how to do something in a series of steps to begin and achieve a simple goal.

### How-to

How-to guides solve real-world problems and a series of steps or directions to
achieve a specific task. A how-to guide answers a question that a user with some
experience could accomplish. The difference between a tutorial and a how-to is
the intended audience. The tutorial audience is that of a complete beginner. The
audience for a how-to guide is experienced users. Less detail is needed and more
assumed knowledge acceptable in a how-to.

### Reference

A reference guide has one purpose: to describe. It is a technical description of
the inner workings. Here a user can find information about APIs, classes, and
functions.  Reference guides are information-oriented. It should not attempt to
explain the basics or achieve everyday tasks.

### Explanation

The explanation is to clarify and is understanding-oriented. Think of it as a
discussion with your audience.  The voice should be informal, take a step back,
and provide a broader view. Here is your opportunity to illuminate a topic. The
reader should feel that they could read it at leisure, so make it enjoyable.

## Links and Reference

- <https://documentation.divio.com>
- <https://google.github.io/styleguide/pyguide.html>
