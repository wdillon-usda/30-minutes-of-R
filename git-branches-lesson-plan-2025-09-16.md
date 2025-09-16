# Git Branches: Lesson Plan, Diagrams, and Exercises  *Generated: 2025-09-16 18:01:10 UTC*

---

## **Lesson Plan: Introduction to Git Branches**

### **Learning Objectives**
- Understand what a branch is in Git.
- Learn why branches are used.
- Practice creating, switching, merging, and deleting branches.
- Apply best practices for using branches in real projects.

---

### **Lesson Outline**

#### 1. **Introduction (10 min)**
- Brief overview of Git and version control.
- Definition of a branch.

#### 2. **Rationale for Using Branches (10 min)**
- Isolation of work.
- Collaboration without conflicts.
- Clean history and experimentation.

#### 3. **Branch Operations (30 min)**
- Creating branches.
- Switching branches.
- Merging branches.
- Deleting branches.

#### 4. **Best Practices (10 min)**
- Naming conventions.
- One feature/fix per branch.
- Regular updates with main.
- Pull Requests and code review.

#### 5. **Hands-On Exercises (20 min)**
- Step-by-step practice (see below).

#### 6. **Q&A and Wrap-Up (10 min)**
- Address student questions.

---

## **Diagrams**

### **1. Branching Workflow (ASCII Diagram)**

```
main
  |
  o-------o--------o------o----------o
         \                   /
          o---o---o---o---o
          feature/add-login
```
- **main:** the main branch
- **feature/add-login:** a feature branch diverging from main

---

### **2. Merging Diagram**

```
main
  |        feature/new-report
  o                  o---o---o
   \                /
    o---o---o---o---o
         (merge)
```
- Shows merging feature branch back into main

---

## **Hands-On Exercises**

### **Exercise 1: Create and Switch Branches**

1. Create a new branch for a feature:
    ```sh
    git branch feature/cool-feature
    ```
2. Switch to your new branch:
    ```sh
    git checkout feature/cool-feature
    ```
3. Make a simple change (edit a file), then commit:
    ```sh
    git add .
    git commit -m "Add cool feature"
    ```

---

### **Exercise 2: Merge Branches**

1. Switch back to main:
    ```sh
    git checkout main
    ```
2. Merge your feature branch:
    ```sh
    git merge feature/cool-feature
    ```

---

### **Exercise 3: Delete a Branch**

After merging:
```sh
git branch -d feature/cool-feature
```

---

### **Exercise 4: Branch Naming Conventions**

List five possible branch names for these tasks:
- Add login feature
- Fix bug in user profile
- Hotfix for deployment
- Update documentation
- Experiment with new UI

---

### **Exercise 5: Conflict Resolution (Optional Advanced)**

1. On two branches, edit the same line in a file.
2. Try merging—observe a conflict.
3. Resolve the conflict and complete the merge.

---

## **Discussion Prompts**

- Why is it risky to always work directly on the main branch?
- What problems could arise from poor branch naming?
- How can regular updates from main help avoid conflicts?

---

## **Resources**

- [Git Branch Documentation](https://git-scm.com/book/en/v2/Git-Branching-Branches-in-a-Nutshell)
- [Interactive Git Branching Tutorial](https://learngitbranching.js.org/)

---

*End of lesson plan. Download and save this file for future reference.*