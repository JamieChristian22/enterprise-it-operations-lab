from generators import tickets, infrastructure, backup

def main():
    tickets.generate()
    infrastructure.generate()
    backup.generate()
    print("Generation complete.")

if __name__=="__main__":
    main()
