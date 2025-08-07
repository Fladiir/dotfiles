pragma Singleton

import qs.utils
import Quickshell

Searcher
{
	id: root 
	useFuzzy: true

	list: DesktopEntries.applications.values.filter(a => !a.noDisplay)

}


