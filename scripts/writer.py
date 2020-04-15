import pandas as pd
from csv import DictWriter
from typing import Dict
from pathlib import Path

class DatasetWriter(object):
	def _createParents(self, path: str) -> None:
		path = Path(path)
		path.parent.mkdir(parents=True, exist_ok=True)
		return

	def writeCsv(self, df: pd.DataFrame, mode: str, location: str) -> None:
		self._createParents(path = location)
		df.to_csv(location, sep=",", mode=mode, header=True, index=False)
		return		

	def writeDictToCsv(self, to_save_dict: Dict, mode: str, location: str) -> None:
		self._createParents(path = location)
		dict_keys = to_save_dict.keys()
		with open(location, mode) as f:
			dict_writer = DictWriter(f, fieldnames=list(dict_keys))
			dict_writer.writerow(to_save_dict)
		return