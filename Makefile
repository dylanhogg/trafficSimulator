venv: ## Create virtual environment
	python3 -m venv venv
	source venv/bin/activate ; pip install --upgrade pip ; python3 -m pip install -r requirements.txt
	source venv/bin/activate ; pip freeze > requirements_freeze.txt

venv_clean:  ## Clean virtual environment
	rm -rf venv

test1:  ## Run test1
	source venv/bin/activate ; PYTHONPATH='./src' python src/tests/test_1.py

test2: ## Run test2
	source venv/bin/activate ; PYTHONPATH='./src' python src/tests/test_2.py

test3:  ## Run test3
	source venv/bin/activate ; PYTHONPATH='./src' python src/tests/test_3.py

example1:  ## Run example diverging_diamond_interchange
	source venv/bin/activate ; PYTHONPATH='./src' python src/examples/diverging_diamond_interchange.py

example2:  ## Run example highway_onramp
	source venv/bin/activate ; PYTHONPATH='./src' python src/examples/highway_onramp.py

example3:  ## Run example roundabout
	source venv/bin/activate ; PYTHONPATH='./src' python src/examples/roundabout.py

example4:  ## Run example twoway_intersection
	source venv/bin/activate ; PYTHONPATH='./src' python src/examples/twoway_intersection.py

help:  ## Help
	@grep -E '^[a-zA-Z_0-9-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
