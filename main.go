package main

import (
	"github.com/sirupsen/logrus"
	"net/http"
)

func foo(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Server", "Go Demo Web Server")
	logrus.Info("foo!!!")
	w.WriteHeader(200)
}

func main() {
	logrus.Info("started docker demo server running on port 8081!")
	http.HandleFunc("/", foo)
	err := http.ListenAndServe(":8081", nil)
	if err != nil {
		logrus.WithError(err).Error("failed to start server")
	}
}
