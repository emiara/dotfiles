from os import system
from ranger.api.commands import Command
class ImageInfo(Command):
    """
    :ImageInfo
    Printer image info default fil under cursor
    """
    def execute(self):
        self.fm.notify(self.rest(1).split()[0])
        system("gnome-terminal -e 'echo hello & sleep 4'")
