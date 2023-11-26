import sys
from rich.console import Console
from rich.markdown import Markdown


args = sys.argv

print(args)
if args != []:
    file = args[1]
    console = Console()
    with open(file) as readme:
        markdown = Markdown(readme.read())
    console.print(markdown)
