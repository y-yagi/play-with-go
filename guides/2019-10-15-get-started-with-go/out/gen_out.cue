package out

Terminals: [{
	Name:        "term1"
	Description: "The main terminal"
	Scenarios: {
		go115: {
			Image: "playwithgo/go1.15.5@sha256:1c332c6b4e73dee8075badc66fe23c7fe51c44ddd2becb6cffc2db81bdaa0b06"
		}
	}
}]
Scenarios: [{
	Name:        "go115"
	Description: "Go 1.15"
}]
Networks: ["playwithgo_pwg"]
Env: []
FilenameComment: false
Steps: {
	goversion: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "goversion"
		Order:           0
		Terminal:        "term1"
		Stmts: [{
			Negated:  false
			CmdStr:   "go version"
			ExitCode: 0
			Output: """
				go version go1.15.5 linux/amd64

				"""
			ComparisonOutput: """
				go version go1.15.5 linux/amd64

				"""
		}]
	}
	pwd_home: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "pwd_home"
		Order:           1
		Terminal:        "term1"
		Stmts: [{
			Negated:  false
			CmdStr:   "pwd"
			ExitCode: 0
			Output: """
				/home/gopher

				"""
			ComparisonOutput: """
				/home/gopher

				"""
		}]
	}
	mkdir_hello: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "mkdir_hello"
		Order:           2
		Terminal:        "term1"
		Stmts: [{
			Negated:          false
			CmdStr:           "mkdir /home/gopher/hello"
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}, {
			Negated:          false
			CmdStr:           "cd /home/gopher/hello"
			ExitCode:         0
			Output:           ""
			ComparisonOutput: ""
		}]
	}
	create_hello: {
		StepType: 2
		Name:     "create_hello"
		Order:    3
		Terminal: "term1"
		Language: "go"
		Renderer: {
			RendererType: 1
		}
		Source: """
			package main

			import "fmt"

			func main() {
			\tfmt.Println("Hello, World!")
			}

			"""
		Target: "/home/gopher/hello/hello.go"
	}
	run_hello: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "run_hello"
		Order:           4
		Terminal:        "term1"
		Stmts: [{
			Negated:  false
			CmdStr:   "go run hello.go"
			ExitCode: 0
			Output: """
				Hello, World!

				"""
			ComparisonOutput: """
				Hello, World!

				"""
		}]
	}
	update_hello: {
		StepType: 2
		Name:     "update_hello"
		Order:    5
		Terminal: "term1"
		Language: "go"
		Renderer: {
			RendererType: 3
			Pre: """
				package main

				import "fmt"

				func main() {
				\tfmt.Println("Hello, World!")
				}

				"""
		}
		Source: """
			package main

			import "fmt"

			import "rsc.io/quote"

			func main() {
			\tfmt.Println(quote.Go())
			}

			"""
		Target: "/home/gopher/hello/hello.go"
	}
	gomodinit: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "gomodinit"
		Order:           6
		Terminal:        "term1"
		Stmts: [{
			Negated:  false
			CmdStr:   "go mod init hello"
			ExitCode: 0
			Output: """
				go: creating new go.mod: module hello

				"""
			ComparisonOutput: """
				go: creating new go.mod: module hello

				"""
		}]
	}
	gogetquote: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "gogetquote"
		Order:           7
		Terminal:        "term1"
		Stmts: [{
			Negated:  false
			CmdStr:   "go get rsc.io/quote@v1.5.2"
			ExitCode: 0
			Output: """
				go: downloading rsc.io/quote v1.5.2
				go: downloading rsc.io/sampler v1.3.0
				go: downloading golang.org/x/text v0.0.0-20170915032832-14c0d48ead0c

				"""
			ComparisonOutput: """

				go: downloading golang.org/x/text v0.0.0-20170915032832-14c0d48ead0c
				go: downloading rsc.io/quote v1.5.2
				go: downloading rsc.io/sampler v1.3.0
				"""
		}]
	}
	run_hello_again: {
		StepType:        1
		DoNotTrim:       false
		InformationOnly: false
		Name:            "run_hello_again"
		Order:           8
		Terminal:        "term1"
		Stmts: [{
			Negated:  false
			CmdStr:   "go run hello.go"
			ExitCode: 0
			Output: """
				Don't communicate by sharing memory, share memory by communicating.

				"""
			ComparisonOutput: """
				Don't communicate by sharing memory, share memory by communicating.

				"""
		}]
	}
}
Hash: "f84600efdfca285c26efcb59e2bf4c6ba73748c82ae73db75ec4d9a71f4a4c6c"
Delims: ["{{{", "}}}"]
