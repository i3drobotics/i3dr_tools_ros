;; Auto-generated. Do not edit!


(when (boundp 'i3dr_phobos_nuclear::SetInt)
  (if (not (find-package "I3DR_PHOBOS_NUCLEAR"))
    (make-package "I3DR_PHOBOS_NUCLEAR"))
  (shadow 'SetInt (find-package "I3DR_PHOBOS_NUCLEAR")))
(unless (find-package "I3DR_PHOBOS_NUCLEAR::SETINT")
  (make-package "I3DR_PHOBOS_NUCLEAR::SETINT"))
(unless (find-package "I3DR_PHOBOS_NUCLEAR::SETINTREQUEST")
  (make-package "I3DR_PHOBOS_NUCLEAR::SETINTREQUEST"))
(unless (find-package "I3DR_PHOBOS_NUCLEAR::SETINTRESPONSE")
  (make-package "I3DR_PHOBOS_NUCLEAR::SETINTRESPONSE"))

(in-package "ROS")





(defclass i3dr_phobos_nuclear::SetIntRequest
  :super ros::object
  :slots (_data ))

(defmethod i3dr_phobos_nuclear::SetIntRequest
  (:init
   (&key
    ((:data __data) 0)
    )
   (send-super :init)
   (setq _data (round __data))
   self)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; int32 _data
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _data
       (write-long _data s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _data
     (setq _data (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass i3dr_phobos_nuclear::SetIntResponse
  :super ros::object
  :slots (_success _message ))

(defmethod i3dr_phobos_nuclear::SetIntResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _success __success)
   (setq _message (string __message))
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass i3dr_phobos_nuclear::SetInt
  :super ros::object
  :slots ())

(setf (get i3dr_phobos_nuclear::SetInt :md5sum-) "41a6318c88ca9d75d7a585e2aa4ca6ea")
(setf (get i3dr_phobos_nuclear::SetInt :datatype-) "i3dr_phobos_nuclear/SetInt")
(setf (get i3dr_phobos_nuclear::SetInt :request) i3dr_phobos_nuclear::SetIntRequest)
(setf (get i3dr_phobos_nuclear::SetInt :response) i3dr_phobos_nuclear::SetIntResponse)

(defmethod i3dr_phobos_nuclear::SetIntRequest
  (:response () (instance i3dr_phobos_nuclear::SetIntResponse :init)))

(setf (get i3dr_phobos_nuclear::SetIntRequest :md5sum-) "41a6318c88ca9d75d7a585e2aa4ca6ea")
(setf (get i3dr_phobos_nuclear::SetIntRequest :datatype-) "i3dr_phobos_nuclear/SetIntRequest")
(setf (get i3dr_phobos_nuclear::SetIntRequest :definition-)
      "int32 data
---
bool success
string message
")

(setf (get i3dr_phobos_nuclear::SetIntResponse :md5sum-) "41a6318c88ca9d75d7a585e2aa4ca6ea")
(setf (get i3dr_phobos_nuclear::SetIntResponse :datatype-) "i3dr_phobos_nuclear/SetIntResponse")
(setf (get i3dr_phobos_nuclear::SetIntResponse :definition-)
      "int32 data
---
bool success
string message
")



(provide :i3dr_phobos_nuclear/SetInt "41a6318c88ca9d75d7a585e2aa4ca6ea")


