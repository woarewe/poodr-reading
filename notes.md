# Chapter 1: Object-oriented Design

## SOLID

**Acronym** - an abbreviation formed from the initial letters of
other words and pronounced as a word (e.g., ASCII , NASA ).

* **S**ingle Responsibility
* **O**pen - Closed
* **L**iskov Substitution
* **I**nterface Segregation
* **D**ependency Injection

### TODO:
- Read https://thoughtbot.com/blog/back-to-basics-solid

## DRY

**D**ont **R**epeat **Y**ourself

## Principle of least knowledge aka Law of Demeter

## Gang of Four

## Agile Manifesto

[here](http://agilemanifesto.org)

## Big Up Front Design

* Anti-pattern, really sad

# Chapter 2: Design of classes with single responsibility

## "True" code is:

- Transparent(понятный)
- Reasonable(обоснованный)
- Usable(практичный)
- Exemplary(образцовый)

# Chapter 3: Dependency management

## Dependency direction choice

- We can depend from things which change the least often
- Some classes change most often
- Specific classes change more often then abstract classes
- If you change class with big count of dependencies,
this will entail widespread consequences.

## Likelihood of change versus number of dependencies
![Changes vs dependencies](https://github.com/woarewe/poodr-reading/blob/master/images/changes_and_dependencies.jpg)
Zones **A**, **B**, **C** are good.
Zone **D** is danger for your app.
