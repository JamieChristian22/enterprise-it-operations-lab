from checks import required_columns, duplicates, nulls, ranges
def main():
    required_columns.run()
    duplicates.run()
    nulls.run()
    ranges.run()
    print("All validation checks completed successfully.")
if __name__=="__main__":
    main()
